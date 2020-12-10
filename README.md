# SMV SUIT
A finance and team management software for the SMV

## Installation

- Install the newest version of Rust https://www.rust-lang.org/tools/install
- Install the newest version of Python3 / Anaconda
- Other required programs (docker-compose.yml in extras) :
    - Postgres 12 (with PostGis)
    - Diesel CLI `cargo install diesel_cli --no-default-features --features postgres`
    - (Optional) PGAdmin4
- Required Python Packages (all newest):
    - flask
    - flask_wtf
    - flask_bootstrap
    - wtforms
    - requests
    - datetime
    - typing
    - aenum
    
- fill out a `.env` file (take the `.env.example` as the template) 
- compile the Rust Project with `cargo build`
- add/remove data in `migrations/<date>_all`
- run `diesel setup` and `diesel migration run`
- start the API with `cargo run`
- start the API Interface with `python api_interface/app.py`

## Roadmap sorted by priority (changes possible)
- [x] Simple Backend
- [x] Simple API Interface
- [x] Simple Frontend
- [x] Finance Calculations (Backend)
- [x] Display and Filter Finance Calculations (Frontend, API Interface)
- [ ] User and Auth System
- [ ] Login and Auth Secured Routes
- [ ] `Technik` Items
- [ ] re-add Projects
- [ ] TODO tables to Projects
- [ ] Add Image support for Projects, Account Statements and other
- [ ] User Group and Project chats
- [ ] Schools Auth API Integration
- [ ] Secured Chats?
- [ ] Role locked Projects
- [ ] Applications for new SMV Members
- [ ] Substitution Plan (Frontend)
- [ ] Mensa Plan (Frontend)
- [ ] Mobile Version (Frontend)
- [ ] Production Ready Frontend (especially Mobile)
- [ ] Update GGApp?
- [ ] Display Shop locations (Frontend)?