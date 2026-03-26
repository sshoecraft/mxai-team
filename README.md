# mxai-team

Team workspace for the [mxai](https://github.com/sshoecraft/mxai) project — connecting AI CLI tools to Matrix as regular chat participants.

## Team

5 AI personas with distinct MBTI-based personalities, all registered in a shared Matrix room ("General") via the shepherd backend.

```
┌────────────┬─────────────────────┬──────────────────────────────────────────────────────────────────┐
│    Bot     │      Role File      │                               MBTI                               │
├────────────┼─────────────────────┼──────────────────────────────────────────────────────────────────┤
│ Commander  │ entj-commander.txt  │ ENTJ — decisive, direct, takes charge, pushes for action         │
├────────────┼─────────────────────┼──────────────────────────────────────────────────────────────────┤
│ Architect  │ intj-architect.txt  │ INTJ — systems thinker, precise, values correctness over speed   │
├────────────┼─────────────────────┼──────────────────────────────────────────────────────────────────┤
│ Diplomat   │ enfj-diplomat.txt   │ ENFJ — people-aware, synthesizer, bridges communication gaps     │
├────────────┼─────────────────────┼──────────────────────────────────────────────────────────────────┤
│ Operator   │ istp-operator.txt   │ ISTP — practical, action-oriented, "show me the results" mindset │
├────────────┼─────────────────────┼──────────────────────────────────────────────────────────────────┤
│ Strategist │ intj-strategist.txt │ INTJ — red-teamer, finds failure modes, pressure-tests plans     │
└────────────┴─────────────────────┴──────────────────────────────────────────────────────────────────┘
```

The Architect and Strategist are both INTJs but play complementary roles — Architect builds frameworks, Strategist tears them down. The Diplomat manages group dynamics, the Commander drives decisions, and the Operator keeps things grounded and practical.

## Project

mxai lets you run AI-powered bots as standard Matrix users. Bots register on Matrix servers, join rooms, respond to messages, and use tools — just like any other user in the room.

Key capabilities:
- Pluggable AI backend adapters (Claude Code, Shepherd, and more)
- Per-bot TOML configuration with CLI override support
- Auto-registration on Matrix servers
- Room commands for bot interaction
- Systemd integration for running bots as services
- Auto-respawn on adapter exit with room notification

See the main project repo for full documentation: [sshoecraft/mxai](https://github.com/sshoecraft/mxai)

## Getting Started

```bash
git clone https://github.com/sshoecraft/mxai-team.git
cd mxai-team
./install.sh
```

The installer will prompt for your Matrix server URL, then install bot configs, role files, and the mkteam launcher.

## Repository Layout

```
bots/       Bot TOML configs (server URL templated, substituted at install)
roles/      Personality/role definition files per bot
mkteam      Launcher script — starts all 5 bots in parallel
install.sh  Installer — prompts for server URL, deploys configs to ~/.config/mxai
```

## License

MIT
