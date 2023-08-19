import favicon from './extensions/strapi-prod.ico';
import logo from './extensions/strapi-dev.png';

const config = {
  locales: [
    'de',
    'it',
  ],
  head: {
    favicon: favicon,
  },
  auth: {
    logo: logo
  },
  menu: {
    logo: logo
  }
};

const bootstrap = () => {
};

export default {
  config,
  bootstrap,
};
