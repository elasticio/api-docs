import * as nconf from 'nconf';
import express from 'express';
import log from './logger';
import { Server as HttpServer } from 'http';
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import path from 'path';
import { JsonRefsOptions, resolveRefs } from 'json-refs';

export default class Server {
    private readonly config: nconf.Provider;
    private readonly router: express.Router;
    private readonly PORT: number;
    private readonly app: express.Application;

    public constructor(config: nconf.Provider) {
        this.config = config;
        this.PORT = this.config.get('PORT');
        this.app = express();
        this.router = express.Router();
    }

    private setErrorHandler(err: any, req: express.Request, res: express.Response, next: express.NextFunction): void {
        if (res.headersSent) {
            return next(err);
        }

        log.error(err, 'Unhandled error');
        res.status(500);
        res.json({ error: 'Server error' });
    }

    public async init(): Promise<HttpServer> {
        log.info('Going to init server routes');

        this.app.use('/', await this.initRoutes());
        this.app.use(this.setErrorHandler.bind(this));
        this.app.disable('x-powered-by');

        log.info({ port: this.PORT }, `Going to start Express server`);

        return new Promise((resolve) => {
            const server = this.app.listen(this.PORT, (): void => {
                log.info({ port: this.PORT }, 'Started express app');
                resolve(server);
            });
        });
    }

    private async initRoutes(): Promise<express.Router> {
        const options: JsonRefsOptions = {
            filter: ['relative', 'remote'],
            loaderOptions: {
                processContent: function (res: any, callback: Function) {
                    callback(null, YAML.parse(res.text));
                }
            }
        };
        const root = YAML.load(path.resolve(__dirname, '../openapi.yaml'));
        const { resolved: swaggerDoc } = await resolveRefs(root, options);

        this.router.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDoc));

        return this.router;
    }
}
