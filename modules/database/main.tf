resource "azurerm_postgresql_server" "group7-postgresinst" {
  name                = "postgresql-server-group7"
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "postgresadmin"
  administrator_login_password = "postgres123!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "group7-postgresdb" {
  name                = "group7postgresdb"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.group7-postgresinst.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
