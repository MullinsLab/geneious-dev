# Geneious runner for plugin developers

The `geneious-dev` script loads and runs the Geneious application as distributed
in the Geneious plugin dev kit. It is written in Ruby, using standard libraries,
in what I believe should be a very backwards-compatible way. That is, I think
it'll run on whatever Ruby you happen to have installed, potentially as old as
1.8.7.

# Installing

Download the [Geneious plugin dev kit][] and copy the `examples/GeneiousFiles`
directory to `$HOME/.geneious-dev`. (Or, put the folder elsewhere and set the
`GENEIOUS_HOME` environment variable to its absolute location.) Move the
`bin/geneious-dev` script onto your path.

Or just run `make install`.

[Geneious plugin dev kit]: https://s3.amazonaws.com/assets.geneious.com/developer/geneious-devkit.zip

# Settting up a plugin project

`geneious-dev` looks in the directory it is executed in for a file named
`run_geneious.yml`, a YAML file containing configuration details for your plugin
in development. Currently supported keys are as follows:

`classpath`: an array of paths to JAR files or folders that should be added
to the Java classpath. You should be able to use the tree of `.class` files or
the built `.jar` file for your plugin more or less interchangeably. For example:

```
classpath:
  - classes
  # or
  - build/edu.washington.demoService/DemoService.jar
  - resources/images
  - lib/dependency.jar
```

`plugin`: The package-qualified class name of your plugin in development. The
Geneious application will load the plugin at runtime using its `extraPlugin`
functionality. For example:

```
plugin: edu.washington.demoService.DemoServicePlugin
```

Loading more than one extra plugin may well be supported by the Geneious dev kit
but as of this moment I don't know the syntax for that, and it's irrelevant to
my purposes, so the value of `plugin` in your run file must be a single string.

# Running

Just run `geneious-dev` in a directory containing a `run_geneious.yml` file.
