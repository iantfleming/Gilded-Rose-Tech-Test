## Gilded-Rose-Tech-Test

## Code style

[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)


## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
+----------+--------+-------+---------+
| Date     | Credit | Debit | Balance |
| 09/02/21 | 1000   | 0     | 1000    |
| 09/02/21 | 2000   | 0     | 3000    |
| 09/02/21 | 0      | 500   | 2500    |
+----------+--------+-------+---------+
```

## User Stories
The following user stories were used to complete specification
```
As a client,
so that I can use the services provided by the bank,
I want to be able to have a bank account.

As a client,
so that I can save money,
I would like to be able to deposit money into my account.

As a client,
so that I can spend money,
I would like to be able to withdraw money from my account.

As a client,
so that I can keep track of my money,
I would like to be able to view a bank statement.
```

## Installation
To install the program do the following:

- Clone this repo

Run:

```
cd Gilded-Rose-Tech-Test
```

Run

```

bundle install
```

## Run tests

To perform tests run:
```
rspec
```
## Use program

To run:

To run:

Can be run from any REPL

```
e.g. in IRB: irb -r "./lib/gilded_rose.rb"
```
