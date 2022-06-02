import { createLogger } from '@elastic.io/bunyan-logger';
import bunyan from 'bunyan';
import config from '../config';

const possibleLogLevels = ['trace', 'debug', 'info', 'warn', 'error', 'fatal'];
const LOG_LEVEL: bunyan.LogLevel = config.get('LOG_LEVEL');
let logLevel: bunyan.LogLevel = Number.MAX_VALUE;

if (typeof LOG_LEVEL === 'string' && possibleLogLevels.includes(LOG_LEVEL)) {
    logLevel = LOG_LEVEL;
}

const logger = createLogger({
    name: 'api-docs',
    level: logLevel
});

export default logger;
