const sql = require("mssql")
const fs = require("fs-extra")
const path = require("path")
require("dotenv").config()

let connection = null

const main = async () => {
  try {
    connection = await sql.connect({
      server: "localhost",
      port: +process.env.MSSQL_PORT || 1433,
      database: "master",
      user: process.env.MSSQL_USER,
      password: process.env.MSSQL_PASSWORD,
      options: {
        encrypt: true,
        trustServerCertificate: true,
      },
    })
  } catch (e) {
    console.log(e)
    connection = null
  }

  if (!connection) process.exit(1)

  console.log("Processing tables query (Restore .bak files)")
  await executeQueryFile("processTables.sql")

  console.log("Processing users query")
  await executeQueryFile("processUsers.sql")

  console.log("Processing all queries done. Exiting...")
  process.exit(0)
}

const getQueryFromFile = (filename) => {
  const query = fs.readFileSync(path.join("../scripts", filename), "utf-8")

  return query
}

const executeQueryFile = async (filename) => {
  const query = getQueryFromFile(filename)
  await connection.query(query)
}

main()
