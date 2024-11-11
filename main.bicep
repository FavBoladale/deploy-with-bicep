param appName string = 'tp-arm-demo'
param environment string = 'devel'
param location string = resourceGroup().location

resource databaseServer 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: '${appName}-sqlserver-${environment}'
  location: location
  properties: {
    administratorLogin: 'mainadmin'
    administratorLoginPassword: 'password@123'
  }
}
resource sqldatabase1 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  parent: databaseServer
  name: '${appName}-sqldb1-${environment}'
  location: location
  sku: {
    name: 'Basic'
    size: 'Basic'
    tier: 'Basic'
  }
}


resource sqldatabase2 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  parent: databaseServer
  name: '${appName}-sqldb2-${environment}'
  location: location
  sku: {
    name: 'Basic'
    size: 'Basic'
    tier: 'Basic'
  }
}
