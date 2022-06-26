/**
 * Environment variables
 * 
 * create a .env.local in the root of your project
 * 
 * example .env.local
 * TEST=1234
 */

export function getServerSideProps() {
  return {
    props: {
      test: process.env.test // => 1234
    }
  };
}
