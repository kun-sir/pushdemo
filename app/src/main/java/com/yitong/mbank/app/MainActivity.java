package com.yitong.mbank.app;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;

import com.mpaas.mps.adapter.api.MPPush;
import com.vivo.push.PushClient;

import alipay.yunpushcore.rpc.ResultPbPB;

public class MainActivity extends FragmentActivity {

    private String thirdToken;
    private String token;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //获取移动分析demo中提供的uid用于绑定push uid，保持统一，方便捞日志（捞日志基于该id值）。
        LocalBroadcastManager.getInstance(this).registerReceiver(new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, final Intent intent) {
                thirdToken = intent.getStringExtra("push_thirdToken");
                token = intent.getStringExtra("push_token");

                int pushType = intent.getIntExtra("push_type", 0);
                String key = intent.getStringExtra("push_key");
                String value = intent.getStringExtra("push_value");
                Log.e("李伟","接受到消息===  " + pushType + key + value);
                boolean isSupport = PushClient.getInstance(context).isSupport();
                Log.e("李伟", "isSupport=" + isSupport);
                if (!TextUtils.isEmpty(token)) {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            MPPush.bind(MainActivity.this, "15810641780", token);
                            Log.e("李伟", "token=" + token);
                            boolean isSupport = PushClient.getInstance(context).isSupport();
                            Log.e("李伟", "isSupport=" + isSupport);
                        }
                    }) {
                    }.start();

                }
                if (!TextUtils.isEmpty(thirdToken)) {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            MPPush.bind(MainActivity.this, "15810641780", thirdToken);
                            Log.e("李伟", "thirdToken=" + thirdToken);
                            boolean isSupport = PushClient.getInstance(context).isSupport();
                            Log.e("李伟", "isSupport=" + isSupport);
                        }
                    }) {
                    }.start();

                }
            }
        }, new IntentFilter(PushMsgService.PUSH_SERVICE_ACTION));
    }

    public void doClick(View view) {
        int id = view.getId();
        if (id == R.id.unbind_button) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    ResultPbPB result = MPPush.unbind(MainActivity.this, "15810641780", token);
                    Log.e("李伟", "unbind=" + result.message + result.code + result.success);
                }
            }) {
            }.start();

        }
    }
}