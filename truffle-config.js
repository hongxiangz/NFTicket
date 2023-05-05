module.exports = {
  networks: {
    development: {
      host: "ganache",   
      port: 8545,      
      network_id: "2024",   
    },
  },

  db: {
    enabled: false
  },

  compilers: {
    solc: {
      version: "^0.8.0",    
      docker: false,       
      settings: {          
        optimizer: {
          enabled: true,
          runs: 200
        },
        evmVersion: "shanghai"
      }
    }
  }