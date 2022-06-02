import config from '../config';
import Server from './server';
import log from './logger';

function exit(err: Error): void {
    log.error(err);
    log.info('About to exit the process...');
    process.exit(1);
}

(async () => {
    try {
        const server = new Server(config);
        await server.init();
    } catch (err) {
        exit(err);
    }
})();

process.on('uncaughtException', function processUncaughtException(err): void {
    log.info('===============================Uncaught Exception===============================');
    return exit(err);
});
