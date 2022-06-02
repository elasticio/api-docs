import conf from 'nconf';
import * as DEFAULTS from './default.json';

conf.use('memory');
conf.env();
conf.defaults(DEFAULTS);
conf.required([
    'PORT'
]);

export default conf;
