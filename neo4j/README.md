neo4j
=====

Neo4j is a highly scalable, robust (fully ACID) native graph database. Neo4j is used in mission-critical apps by thousands of leading, startups, enterprises, and governments around the world.

With the Dockerfile on repository you've a docker neo4j community edition image ready to go.

### Setup

1. Execute this command:

	`docker run -i -t -d --name neo4j --privileged -p 7474:7474 tpires/neo4j`

2. Access to http://localhost:7474 with your browser.
