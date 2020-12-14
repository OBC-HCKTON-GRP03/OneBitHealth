<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<p align="center">
  <h3 align="center">One Bit Health</h3>

  <p align="center">
    Keep your health information one click away!
    <br />
    <a href="https://github.com/OBC-HCKTON-GRP03/OneBitHealth"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#">View Demo</a>
    ·
    <a href="https://github.com/OBC-HCKTON-GRP03/OneBitHealth/issues">Report Bug</a>
    ·
    <a href="https://github.com/OBC-HCKTON-GRP03/OneBitHealth/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

[![One Bit Health Screen Shot][product-screenshot]](#)

Project created for the first hackaton of the One Bit Code Fullstack Developer Bootcamp.

### Built With
* [Ruby on Rails](https://rubyonrails.org/)
* [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)
* [CSS](https://www.w3.org/Style/CSS/Overview.en.html)
* [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

  Ruby version: 2.7.1

  Postgre SQL version: 13.1

  Yarn version: 1.22.5

### Installation

1. Clone the repo
  ```sh
  git clone https://github.com/OBC-HCKTON-GRP03/OneBitHealth.git
  ```
2. Go to the project folder
  ```sh
  cd OneBitHealth
  ```
3. Install all project dependencies running
  ```sh
  bundle install
  ```
  And after that:
  ```sh
  yarn install
  ```
4. We used Docker to create a container for Postgre SQL:
  * Run once:
  ```sh
  docker run --name onebithealth_postgres -e POSTGRES_PASSWORD=<your password> -d -p 5433:5432 postgres:13.1
  ```
  * After the container is created, you just need to run every time you want to access the application:
  ```sh
  docker start onebithealth_postgres
  ```
5. Alter the postgres user password with the one you used in the command above in the /config/database.yml file.
6. Create the databases for test and development environments
  ```sh
  rails db:create
  ```
7. Run all database migrations
  ```sh
  rails db:migrate
  ```
8. Run the RSpec tests
  ```sh
  bundle exec rspec
  ```
9. Run the Cucumber acceptance tests
  ```sh
  bundle exec cucumber
  ```

<!-- USAGE EXAMPLES -->
## Usage
Start the Rails Server:
  ```sh
  rails s
  ```

Go to your favorite browser, access the project URL (localhost:3000) and start to create your health history.


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/OBC-HCKTON-GRP03/OneBitHealth/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Diego de A. Senott - [@senott](https://twitter.com/senott) - senott@yahoo.com  
Haroldo Furtado - haroldofurtado@gmail.com  
Jorge Borges - jorgeborgesdev@gmail.com  
Ricardo Utino - [@Uc_Richard](https://twitter.com/Uc_Richard) - rickutino@gmail.com  
Thomás Escolástico Bueno - thomasbuenou@gmail.com  

Project Link: [https://github.com/OBC-HCKTON-GRP03/OneBitHealth](https://github.com/OBC-HCKTON-GRP03/OneBitHealth)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* Bootstrap version 4.3;
* jQuery;




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/OBC-HCKTON-GRP03/OneBitHealth.svg?style=flat-square
[contributors-url]: https://github.com/OBC-HCKTON-GRP03/OneBitHealth/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/OBC-HCKTON-GRP03/OneBitHealth.svg?style=flat-square
[forks-url]: https://github.com/OBC-HCKTON-GRP03/OneBitHealth/network/members
[stars-shield]: https://img.shields.io/github/stars/OBC-HCKTON-GRP03/OneBitHealth.svg?style=flat-square
[stars-url]: https://github.com/OBC-HCKTON-GRP03/OneBitHealth/stargazers
[issues-shield]: https://img.shields.io/github/issues/OBC-HCKTON-GRP03/OneBitHealth.svg?style=flat-square
[issues-url]: https://github.com/OBC-HCKTON-GRP03/OneBitHealth/issues
[license-shield]: https://img.shields.io/github/license/OBC-HCKTON-GRP03/OneBitHealth.svg?style=flat-square
[license-url]: https://github.com/OBC-HCKTON-GRP03/OneBitHealth/blob/main/LICENSE.txt
[product-screenshot]: /app/assets/images/homescreen.png
