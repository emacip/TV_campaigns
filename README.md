

##Task:

Create a rails application to show the results for TV SMS voting campaigns,
derived from the log data similar to the attached tarball.


##Abstract:

Accord with the task, I split the problems in two parts.

First, import all the data.

At the beginning I used a normal rake to import all the data. I made a battery of test to check that all the content was imported correctly. There is some issues in the file that you provide me, UTF-8 compatibility.
I add something that I hated, rescue code. When I solved this part, my idea was always  use Elasticsearch to do all the querys arround the vote elements, so I put a sidekiq worker and create the mapping for votes. Now everytime that we want to import this votes, in the model I can indexed the values with ES.

There is an script to create the vote mapping in the
```
es_votes.sh
```

The second part was create the filters and sort the information we have in the data base. In the votes_controller there is the search function, and for do more easy the work, I prepared an array of results where I save the name of the guys and in a hash I put the differents scores so is more easy to paint in the view.


##Make this run:

* Rails, in your machine.
* Redis runing
* Elasticsearch runing

Later we continue with this

- ```bunlde exec sidekiq``` to run the sidekiq
- execute the es_votes.sh  file to create the mapping ``` sh es_votes.sh```
- ```rake vote:import```  to import all the elements from the file.

```rails s``` and see the results of the campaigns