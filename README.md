# Workspace FS Client

This agent allows you to connect your local machine (or server) to the cloud IDE.

Once connected, you can work with your files remotely via:
👉 https://ide.caiplatform.co/

## Requirements

Make sure you have the following installed:

- Git
- Docker (the agent runs containers under the hood)

Without these, nothing magical will happen.

## Setup

### 1. Clone the repository

```bash
git clone git@github.com:caiplatform/workspace-fs-client.git
cd workspace-fs-client
```

### 3. Start the agent

```bash
./up.sh --with-cloud-tunnel
```

## Usage

1. Run the agent (see above)
2. Open https://ide.caiplatform.co
3. Enter your host (the one provided by the ngrok)
4. Start working with your machine remotely

## Notes

- The connection is tied to your running agent
- If you stop it, access is gone (yes, intentionally)
- Each run may generate a new host

## Summary

Run agent → get host → open IDE → work
