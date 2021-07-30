package com.yitong.mbank.app;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.os.Build;

import androidx.core.app.NotificationCompat;

import com.alipay.pushsdk.data.BDataBean;

import static android.app.PendingIntent.FLAG_CANCEL_CURRENT;


public class NotificationHelper extends ContextWrapper {
    private NotificationManager mManager;
    private static final String CHANNEL_ID = "pushChannel";
    private static final String CHANNEL_NAME = "push渠道";

    public NotificationHelper(Context context) {
        super(context);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            int importance = NotificationManager.IMPORTANCE_HIGH;
            createNotificationChannel(CHANNEL_ID, CHANNEL_NAME, importance);
        }
    }

    @TargetApi( Build.VERSION_CODES.O )
    private void createNotificationChannel(String channelId, String channelName, int importance) {
        NotificationChannel channel = new NotificationChannel(channelId, channelName, importance);
        channel.setLightColor(Color.GRAY);
        channel.setLockscreenVisibility(Notification.VISIBILITY_PUBLIC);
        getManager().createNotificationChannel(channel);
    }

    private Notification getNotification(BDataBean data) {
        Notification notification;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            notification = new Notification.Builder(this, CHANNEL_ID)
                    .setContentTitle(data.getTitle())
                    .setContentText(data.getContent())
                    .setWhen(System.currentTimeMillis())
                    .setChannelId(CHANNEL_ID)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .setContentIntent(getIntent(data))
                    .setLargeIcon(BitmapFactory.decodeResource(getResources(), R.mipmap.ic_launcher))
                    .setAutoCancel(true)
                    .build();
        } else {
            notification = new NotificationCompat.Builder(getApplicationContext(), CHANNEL_ID)
                    .setContentTitle(data.getTitle())
                    .setContentText(data.getContent())
                    .setWhen(System.currentTimeMillis())
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .setContentIntent(getIntent(data))
                    .setLargeIcon(BitmapFactory.decodeResource(getResources(), R.mipmap.ic_launcher))
                    .setAutoCancel(true)
                    .build();
        }
        return notification;
    }

    private PendingIntent getIntent(BDataBean data) {

        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
//        MsgBean bean = new MsgBean();
//        bean.setTitle(data.getTitle());
//        bean.setTemplateKeyValue(data.getContent());
//        bean.setTargetMsgKey(data.getParams());
//        intent.putExtra("msg", bean);
        return PendingIntent.getActivity(getApplicationContext(), 1, intent, FLAG_CANCEL_CURRENT);

    }

    public void notify(BDataBean data) {
        getManager().notify(1, getNotification(data));
    }

    private NotificationManager getManager() {
        if (mManager == null) {
            mManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        }
        return mManager;
    }
}
