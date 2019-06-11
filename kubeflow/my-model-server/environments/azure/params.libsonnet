local params = std.extVar('__ksonnet/params');
local globals = import 'globals.libsonnet';
local envParams = params + {
  components+: {
    serveInception+: {
      modelServerImage: 'sozercan/tensorflow-model-server',
      modelPath: 's3://kubeflow/models/myjob/export/inception/',
      s3Enable: true,
      s3SecretName: 'serving-creds',
      s3SecretAccesskeyidKeyName: 'accessKeyID',
      s3SecretSecretaccesskeyKeyName: 'secretAccessKey',
      s3Endpoint: 'http://13.68.199.80:9000',
      s3AwsRegion: 'us-east-1',
      s3UseHttps: 0,
      s3VerifySsl: 0,
      serviceType: 'LoadBalancer',
    },
  },
};

{
  components: {
    [x]: envParams.components[x] + globals
    for x in std.objectFields(envParams.components)
  },
}