# Simple Docker

> Russian version: [README_ru.md](README_ru.md)

A practical project focused on containerization with Docker.

The project explores the core Docker workflow step by step: working with images and containers, modifying service configuration inside containers, building custom Docker images, performing image security analysis, and deploying multi-container applications with Docker Compose.

As a final result, a custom Docker image is created containing a FastCGI web application behind an Nginx reverse proxy.

## Project Topics

* Docker images
* Docker containers
* Docker CLI
* Nginx
* FastCGI
* Dockerfile
* Docker volumes
* Docker networking
* Dockle
* Docker Compose

## Skills Demonstrated

After completing the project, the following tasks are covered:

* working with Docker images and containers;
* starting and stopping containers;
* inspecting container parameters through Docker CLI;
* modifying service configuration inside containers;
* exporting and importing containers;
* building custom Docker images;
* compiling applications inside containers;
* configuring Nginx reverse proxying;
* performing Docker image security checks;
* deploying multi-container applications with Docker Compose.

## Project Structure

* [Part 1](docs/eng/Part1.md) — Working with the official Nginx image
* [Part 2](docs/eng/Part2.md) — Container configuration management
* [Part 3](docs/eng/Part3.md) — FastCGI application development
* [Part 4](docs/eng/Part4.md) — Building a custom Docker image
* [Part 5](docs/eng/Part5.md) — Docker image security analysis with Dockle
* [Part 6](docs/eng/Part6.md) — Application deployment with Docker Compose

## Getting Started

To complete the project, the following tools are required:

* Docker Engine;
* Docker Compose;
* Linux or WSL;
* basic Linux command-line skills.

The parts are intended to be completed sequentially, starting with [Part 1](docs/eng/Part1.md).

## Repository Layout

```text
.
├── docs/
│   ├── ru/
│   └── eng/
├── images/
├── src/
│   ├── final/
│   └── history/
├── README_ru.md
└── README.md
````

## Tools Used

* Docker
* Docker Compose
* Nginx
* FastCGI
* GCC
* spawn-fcgi
* Dockle