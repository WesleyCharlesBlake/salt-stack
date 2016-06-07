Salt states to provision configs for various web based servers.

Packer will build base AMI's provisioned from the salt states. You can then use spin up the various host group salt-minions required, accept the keys on your salt master, and salt will kick off high state and install/update packages where necessary.

Be sure to update the path to your salt local tree and minion config in the packer template, as well as the path to your AWS keys.

Once you have updated your salt states, you will want to build the base ami:
```packer validate aws-base.json```

Make sure you dont have any syntax errors

```packer build aws-base.json```

Take not of the AMI id once its built successfully. You can then plug that into your a terraform script, and build off this ami 

Have a look at my TerraForm [example](https://github.com/WesleyCharlesBlake/aws-terraform) or read about packer and TerraForm [here](http://blog.stratotechnology.com/packer-and-terraform/)