import { exec } from 'child_process'

export const runGitPull = async (req, res) => {
  exec('sh script.sh', (error, stdout, stderr) => {
    if (error) {
      console.error(`Error executing script: ${error.message}`);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(`Script output: ${stdout}`);
    res.status(200).send('Script executed successfully');
  });
}

let serverRestarted = false;

export const runPm2Service = async (req, res) => {
  const { cmd } = req.query
  exec(cmd)
  // exec('pm2 stop all')
  process.exit()
}

//test2