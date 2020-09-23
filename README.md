# GitHub Action to upload files to Azure Blob Storage containers

This action is designed to use the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to upload files from a local directory an Azure Blob Storage container.

## Usage

### Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: Upload Files To Azure Blob Storage
on:
  push:
    branches:
      - master
jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: karlsgate/azure-blob-upload@v1
        with:
          source-directory: _dist
          container-name: www
          connection-string: ${{ secrets.ConnectionString }}
          pattern: '*.tar.gz'
```

### Required Variables

| Key                 | Value                                                                    |
|---------------------|--------------------------------------------------------------------------|
| `source-directory`  | The local directory containing the files to upload                       |
| `container-name`    | The name of the destination storage account container                    |
| `connection-string` | The connection string with SAS token for the destination storage account |

### Optional Variables

| Key          | Value                                                                          |
|--------------|--------------------------------------------------------------------------------|
| `pattern`    | An optional file pattern to limit the files uploaded from the source directory |

## License

This project is distributed under the [MIT License](LICENSE.md).
