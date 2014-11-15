Architect Challenge
===================
Architect Challenge is the first weekend, individual project at Makers Academy. This is testing students' understanding of TDD and OOP and the skills of using Ruby and RSpec.
Specification
-------------

In this project I am designing FAAST(Fast And Accessible Super Tube) system which can be deployed into the London underground network. The FAAST system will cater for the following:

* there will be a number of trains inside the system
* trains will travel from station to station
* inside of a station, when the train stops, passengers will alight and enter the carriages of the train
* a passenger will touch in at the station and touch out at the destination station
* each coach of a train can hold up to 40 passengers
* each train is made of a number of coaches
* the passengers can only touch in a station if their account has more than £2

Languages and Tools
-------------------
* Ruby
* RSpec

How to use
----------
Clone the repository:
```
git clone git@github.com:annaschechter/architect-challenge.git
```
Run RSpec to see the tests:
```
$ rspec
```
Start irb:
```
$ irb
```
Require the runner file:
```
> require '/lib/runner.rb'
```
