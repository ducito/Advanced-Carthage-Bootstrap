# Advanced Carthage Bootstrap
Faster way to update outdated dependencies and reduce Carthage bootstraping time.

### How to use:

Place `carthage_bootstrap` file on your repository.

Make sure that we can execute that file on the Terminal by running this cammand:

```bash
chmod 755 carthage_bootstrap
```

Finally, you can update all dependencies by running this command:

```bash
./carthage_bootstrap
```



To re-generate script file:

```bash
shc -f carthage_bootstrap.sh -o carthage_bootstrap
```

