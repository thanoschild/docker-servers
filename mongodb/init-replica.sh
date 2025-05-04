#!/bin/bash

# Wait for MongoDB to be ready
until mongosh --quiet --username admin --password admin --authenticationDatabase admin --eval "db.adminCommand('ping')" > /dev/null 2>&1; do
  echo "Waiting for MongoDB to start..."
  sleep 2
done

echo "MongoDB is up. Initiating replica set..."

# Initiate replica set and set host to localhost:27017
mongosh --username admin --password admin --authenticationDatabase admin <<EOF
try {
  const cfg = {
    _id: "rs0",
    members: [{ _id: 0, host: "localhost:27017" }]
  };
  rs.initiate(cfg);
  print("Replica set initiated.");
} catch (e) {
  print("Replica set may already be configured. Attempting reconfig...");
  const cfg = rs.conf();
  cfg.members[0].host = "localhost:27017";
  rs.reconfig(cfg, { force: true });
  print("Replica set reconfigured.");
}
EOF
