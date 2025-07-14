# AWS Lambda Node.js Runtime Upgrade Documentation

## Overview

This document outlines the code changes required when upgrading AWS Lambda functions from **Node.js 12.x** to **Node.js 18.x**. The primary challenge was migrating from **AWS SDK v2** (which was removed in Node.js 18.x) to **AWS SDK v3**.

## Background

- **Node.js 12.x runtime**: Included AWS SDK v2 by default
- **Node.js 18.x runtime**: Only includes AWS SDK v3, with different syntax and patterns
- **Impact**: All functions using `require('aws-sdk')` needed code updates

---

## Function 1: AWS Glue Crawler Initializer

**Purpose**: Starts an AWS Glue crawler for data processing

### Changes Made

#### 1. Import Statement Update
```javascript
// OLD (AWS SDK v2)
const AWS = require('aws-sdk');

// NEW (AWS SDK v3)
const { GlueClient, StartCrawlerCommand } = require('@aws-sdk/client-glue');
```
**Why**: AWS SDK v3 uses modular imports instead of importing the entire SDK

#### 2. Service Client Creation
```javascript
// OLD (AWS SDK v2)
const glue = new AWS.Glue();

// NEW (AWS SDK v3)
const glue = new GlueClient({});
```
**Why**: SDK v3 uses specific service clients with different constructor patterns

#### 3. Service Method Invocation
```javascript
// OLD (AWS SDK v2 - Callback Pattern)
glue.startCrawler({ Name: 'AWSCURCrawler-Landing_Zone' }, function(err, data) {
    if (err) {
        // error handling
    } else {
        // success handling
    }
});

// NEW (AWS SDK v3 - Promise + Command Pattern)
const command = new StartCrawlerCommand({ Name: 'AWSCURCrawler-Landing_Zone' });
glue.send(command).then((data) => {
    // success handling
}).catch((err) => {
    // error handling
});
```
**Why**: SDK v3 uses command objects and promises instead of direct method calls with callbacks

### Summary of Changes
- **3 minimal code changes** required
- **Same business logic** maintained
- **Error handling** preserved with updated syntax
- **No functional behavior changes**

---

## Function 2: S3 Bucket Notification Configuration

**Purpose**: Configures S3 bucket notifications to trigger Lambda functions

### Changes Made

#### 1. Import Statement Update
```javascript
// OLD (AWS SDK v2)
const AWS = require('aws-sdk');

// NEW (AWS SDK v3)
const { S3Client, PutBucketNotificationConfigurationCommand } = require('@aws-sdk/client-s3');
```
**Why**: Modular imports for S3 service and specific command needed

#### 2. Service Client Creation
```javascript
// OLD (AWS SDK v2)
const s3 = new AWS.S3();

// NEW (AWS SDK v3)
const s3 = new S3Client({});
```
**Why**: S3Client replaces the generic AWS.S3() constructor

#### 3. Service Method Invocation
```javascript
// OLD (AWS SDK v2 - Callback Pattern)
s3.putBucketNotificationConfiguration({
    Bucket: event.ResourceProperties.BucketName,
    NotificationConfiguration: notificationConfiguration
}, function(err, data) {
    if (err) reject({ msg: this.httpResponse.body.toString(), error: err, data: data });
    else resolve(data);
});

// NEW (AWS SDK v3 - Command + Promise Pattern)
const command = new PutBucketNotificationConfigurationCommand({
    Bucket: event.ResourceProperties.BucketName,
    NotificationConfiguration: notificationConfiguration
});
s3.send(command).then(function(data) {
    resolve(data);
}).catch(function(err) {
    reject({ msg: err.message, error: err, data: null });
});
```
**Why**: SDK v3 requires command objects and uses promises instead of callbacks

### Summary of Changes
- **3 minimal code sections** updated
- **31 lines maintained** (no line count increase)
- **All S3 notification logic** preserved
- **CloudFormation integration** unchanged

---

## Key Migration Patterns

### 1. Import Pattern Change
```javascript
// v2: Import entire SDK
const AWS = require('aws-sdk');

// v3: Import specific services and commands
const { ServiceClient, SpecificCommand } = require('@aws-sdk/client-service');
```

### 2. Client Creation Pattern Change
```javascript
// v2: Generic service constructor
const service = new AWS.ServiceName();

// v3: Specific service client
const service = new ServiceNameClient({});
```

### 3. Method Invocation Pattern Change
```javascript
// v2: Direct method calls with callbacks
service.methodName(params, function(err, data) { ... });

// v3: Command objects with promises
const command = new MethodNameCommand(params);
service.send(command).then(data => { ... }).catch(err => { ... });
```

---

## Benefits of the Migration

1. **Security**: Updated to supported Node.js runtime with latest security patches
2. **Performance**: AWS SDK v3 is more modular and lightweight
3. **Future-proofing**: Functions will continue to receive AWS service updates
4. **Compliance**: Meets AWS deprecation requirements

## Validation

Both functions were tested before and after migration to ensure:
- ✅ Same input/output behavior
- ✅ Same error handling patterns
- ✅ Same integration with CloudFormation (where applicable)
- ✅ Same AWS service interactions

## Rollback Consideration

**Important**: Node.js versions below 18.x are no longer supported for new updates after the deprecation deadline. These changes are permanent and necessary for continued function maintainability.

---

## Timeline

- **Before November 1, 2025**: Functions could be updated with old or new runtime
- **After November 1, 2025**: Functions cannot be updated unless using Node.js 18.x or newer
- **Migration completed**: Both functions successfully upgraded and tested