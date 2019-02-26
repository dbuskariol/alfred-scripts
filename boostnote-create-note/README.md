### boostnote-create-not

#### Installation

To use this script, you need the `node` module `uuid`. Please ensure `node` is [installed on your system](https://nodejs.org/en/), then follow the steps below:

1. `git clone git@github.com:dbuskariol/create-boostnote-cli.git`
2. `cd create-boostnote-cli`
3. `npm install uuid`

#### Setup

The script sets variables that are used to fill the node metadata. Please set the following variables located at the top of the `create_note.sh` script:

```
node_path="path/to/node/binary"
note_folder="note_folder_id"
note_title="title"
note_body="body"
note_storage_path="path/to/boostnote/storage"
```

In this context:

- `node_path` refers to the path of the `node` binary. For example: `/Users/<username>/.nodenv/versions/<node_version>/bin/node`
- `note_folder` refers to the folder ID that you store your notes in. This can be found by navigating to Boostnote preferences, clicking on the "Storage" tab and selecting the ID beside the folder name. For example in the folder `Important Things(3e22846e3dab55ea2874)`, `3e22846e3dab55ea2874` would be the `note_folder` value.
- `note_title` refers to the title you want the note to have
- `note_body` refers to the body you want the note to have
- `note_storage_path` refers to the full path of the Boostnote storage folder. For example: `/Users/<username>/Library/Application Support/Boostnote/Storage"`

#### Usage

In Alfred, run `bn <note_input>` where `<note_input>` is your configured note input such as title or body.