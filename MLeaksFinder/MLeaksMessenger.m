/**
 * Tencent is pleased to support the open source community by making MLeaksFinder available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company. All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 *
 * https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */

#import "MLeaksMessenger.h"

static __weak UIAlertView *alertView;

@implementation MLeaksMessenger

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    [self alertWithTitle:title message:message delegate:nil additionalButtonTitle:nil];
}

+ (void)alertWithTitle:(NSString *)title
                  message:(NSString *)message
                 delegate:(id<UIAlertViewDelegate>)delegate
    additionalButtonTitle:(NSString *)additionalButtonTitle {
    NSLog(@"%@: %@", title, message);

    UIAlertController *aleView = [UIAlertController
                                  alertControllerWithTitle:title
                                                   message:message
                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [aleView addAction:cancel];

    [[self appRootViewController] presentViewController:aleView animated:YES completion:nil];
}

+ (UIViewController *)appRootViewController {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = rootVC;

    while (topVC.presentedViewController)
        topVC = topVC.presentedViewController;
    return topVC;
}

@end
