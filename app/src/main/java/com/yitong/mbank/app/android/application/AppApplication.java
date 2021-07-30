package com.yitong.mbank.app.android.application;

import android.app.Application;
import android.os.Build;

import com.alipay.mobile.framework.quinoxless.QuinoxlessApplicationLike;
import com.mpaas.mps.adapter.api.MPPush;


public class AppApplication extends QuinoxlessApplicationLike {

    @Override
    public void onMPaaSFrameworkInitFinished() {
        if (Build.VERSION.SDK_INT != Build.VERSION_CODES.O && Build.VERSION.SDK_INT != Build.VERSION_CODES.O_MR1) {
            MPPush.setup((Application) getApplicationContext());
            MPPush.init(getApplicationContext());
        }
    }
}
