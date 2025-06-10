<p align="center">
  <img src=".github/images/logo_dark.svg" alt="OrbitChat Logo" width="400" />
</p>

<p align="center">
  <a href="https://github.com/magdielcardoso/orbitchat.io/blob/main/LICENSE">
    <img alt="License: AGPL v3" src="https://img.shields.io/github/license/magdielcardoso/orbitchat.io?color=blue">
  </a>
  <a href="https://github.com/magdielcardoso/orbitchat.io/commits/main">
    <img alt="Last Commit" src="https://img.shields.io/github/last-commit/magdielcardoso/orbitchat.io">
  </a>
  <a href="https://github.com/magdielcardoso/orbitchat.io/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/magdielcardoso/orbitchat.io">
  </a>
  <a href="https://github.com/magdielcardoso/orbitchat.io/pulls">
    <img alt="Pull Requests" src="https://img.shields.io/github/issues-pr/magdielcardoso/orbitchat.io">
  </a>
  <a href="https://github.com/magdielcardoso/orbitchat.io/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/magdielcardoso/orbitchat.io?style=social">
  </a>
  <a href="https://github.com/magdielcardoso/orbitchat.io/network/members">
    <img alt="Forks" src="https://img.shields.io/github/forks/magdielcardoso/orbitchat.io?style=social">
  </a>
</p>

# OrbitChat
### Open Source Customer Support Platform

## Tech Stack

- **Backend:** Ruby on Rails 8
- **Database:** PostgreSQL (with PGVector)
- **Frontend:** Inertia.js, Vue 3, Vite
- **Styling:** Tailwind CSS
- **Authentication:** Devise
- **Admin:** Administrate
- **State Machines:** AASM
- **Other:** pnpm, TypeScript, Lucide Icons, etc.

## Development Setup

### Prerequisites

- **Ruby** (version compatible with Rails 8, e.g. 3.3+)
- **Node.js** (v20+ recommended)
- **pnpm** (preferred, see `package.json`)
- **Bundler** (`gem install bundler`)
- **A working database** (default: PostgreSQL with PGVector)
- **Foreman**, **Overmind** or **Hivemind** (for process management, optional but recommended)

### 1. Install dependencies

```sh
bin/setup
```

This will:
- Install Ruby gems (`bundle install`)
- Prepare the database (`rails db:prepare`)
- Clean logs and temp files
- Start the development server (see below)

### 2. Start the development environment

If `bin/setup` did not start the server automatically, run:

```sh
bin/dev
```

This will launch:
- Rails server (API + Inertia backend)
- Vite dev server (frontend hot reload)
- Tailwind CSS watcher

### 3. Access the app

Open your browser at: [http://localhost:3000](http://localhost:3000)

### 4. Running tests

```sh
bin/rails test
```

### 5. Useful scripts

- `bin/setup` — One-shot setup for new environments
- `bin/dev` — Starts all dev processes (Rails, Vite, Tailwind)
- `bin/rails` — Rails CLI
- `bin/vite` — Vite CLI

## License

The main source code of this repository is licensed under the [GNU Affero General Public License v3.0 (AGPL-3.0)](./LICENSE).

**Important:** All content within the `/enterprise` directory is subject to a separate, proprietary license, as defined in [`/enterprise/LICENSE`](./enterprise/LICENSE). This code is 100% proprietary and owned exclusively by Magdiel Cardoso (user: magdielcardoso). Any unauthorized use, distribution, modification, or reverse engineering is strictly prohibited. For details regarding rights, restrictions, and permissions, please refer to the license file or contact the project owner.
