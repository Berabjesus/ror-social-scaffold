# Scaffold for social media app with Ruby on Rails

> This repo includes intial code for social media app with basic styling. Its purpose is to be a starting point for Microverse students.

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: MIT][license-shield]][license-url]


## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## See the Live version here - > [Live Link](https://enigmatic-bastion-44052.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

### Instal gems with:

```
bundle install
```

### Setup database with:
```
   rails db:create
   rails db:migrate
```

### Install Bootstrap:

```yarn add bootstrap jquery popper.js```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests
- Uncomment the code below on the test group of the gemfile for Linux OS
```gem 'chromedriver-helper', '~> 2.1', '>= 2.1.1'```

- Uncomment the code below on the test group of the gemfile for windows OS
``` gem 'chromedriver-helper', '1.2.0'```

- Run ```bundle install```

- Run  ```bundle exec rspec ``` to run the tests.


### Deployment

- Create a heroku account and install the heroku CLI
- Go to the root of this project directory and run `heroku login` from a terminal.
- The browser will open up a login interface, click on login.
- Make sure the current branch is the `master` branch
- Now run the `heroku create` command to add a new remote address for the project.
- Check this by running the `git remote -v` 
- Run the `git push heroku master -f` command
- Run the `heroku run rails db:migrate` command

## Authors

👤 **Peris Ndanu**

- Github: [@mimipeshy](https://github.com/mimipeshy)
- Linkedin: [Peris Ndanu](https://www.linkedin.com/in/peris-ndanu-405083193/)

👤 **Bereket Beshane**

- Github: [@berabjesus](https://github.com/Berabjesus)
- Twitter: [@bereket_ababu_b](https://twitter.com/bereket_ababu_b)
- Linkedin: [linkedin](https://www.linkedin.com/in/bereket-beshane-a1b75a1a9/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Berabjesus/ror-social-scaffold/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Heroku

## 📝 License

None


[contributors-shield]: https://img.shields.io/github/contributors/Berabjesus/ror-social-scaffold
[contributors-url]: https://github.com/Berabjesus/ror-social-scaffold/contributors
[forks-shield]: https://img.shields.io/github/forks/Berabjesus/ror-social-scaffold
[forks-url]:https://github.com/Berabjesus/ror-social-scaffold/network/members
[stars-shield]: https://img.shields.io/github/stars/Berabjesus/ror-social-scaffold
[stars-url]: https://github.com/Berabjesus/ror-social-scaffold/stargazers
[issues-shield]: https://img.shields.io/github/issues/Berabjesus/ror-social-scaffold
[issues-url]: https://github.com/Berabjesus/ror-social-scaffold/issues
[license-shield]: https://img.shields.io/badge/License-MIT-yellow.svg
[license-url]: https://github.com/Berabjesus/ror-social-scaffold/development/LICENSE




