<b>NOTICE:</b> To run this application, please acquire your own personal OMDB key at http://www.omdbapi.com and add it in the application.yml file of the omdb-service application.

---------

The goal of this microservice application is to be able to create user owned lists of movies. The persistance service saves a user with the list of movies consisting of an IMDB id and an "is owned" flag per movie. The output of this list is enriched with IMDB movie data from omdbapi.com through the use of reactive programming.

---------

Docker network is created and containers are built with the script setup.sh

Docker containers are spun up with run.sh

The gateway service can now be accessed locally.

If you are not using the scripts provided to run the services as docker containers, you will need to change the application.yml files of services to point to consul (all services) and mongodb (movie list service) servers. By default they are pointing to host names 'consul' and 'mongodb', instead you may want to change these to 'localhost'. No configuration is needed to connect the microservices, this is all managed by Consul.

---------

New users are created by POSTing to http://localhost:8080/api/user (gateway address) in the following format:

```
{ "userName" : "edwin", 
	"movies" : [ 
		{
			"imdbId" : "tt1285016",
			"inCollection": "true"
		}, {
			"imdbId" : "tt0100502",
			"inCollection" : "false"
		} ]
}
```

User information is retrieved with GET http://localhost:8080/api/user/{username} 

---------

This demonstration is based on a Micronaut microservices tutorial by Sergio del Amo Caballero from infoq.com:

https://www.infoq.com/articles/micronaut-tutorial-microservices-jvm

The follow-up tutorial is aimed at the use of tracing (monitoring) and security measures:

https://www.infoq.com/articles/micronaut-tracing-security-serverless

This part of the infoq tutorial is not yet part of the demonstration. Please note: Micronaut provides /info, /monitor, /health etc. endpoints to monitor your services.
