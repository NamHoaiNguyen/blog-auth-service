import fs from 'fs';

async function readKey(file_path) {
  // try {
  //   const data = await fs.readFile(file_path, { encoding: 'utf8' })
  //   console.log(data)
  //   return data
  // } catch (err) {
  //   console.log(err);
  // }

  fs.readFile(file_path, 'utf8', (err, data) => {
    if (err) {
      console.error(err);
      return;
    }

    console.log("Namnh2 check private key data: ", data)
    return data
  });
}

export {
  readKey
}
