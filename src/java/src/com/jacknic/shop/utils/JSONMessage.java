package com.jacknic.shop.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * JSON响应信息
 */
public class JSONMessage extends JSONObject {

    public JSONMessage() {
        super();
        put("data", null);
        put("success", true);
    }

    public boolean isSuccess() {
        return getBoolean("success");
    }

    /**
     * 设置请求是否成功，默认是true
     */
    public void setSuccess(boolean success) {
        put("success", success);
    }

    public Object getData() {
        return getBoolean("data");
    }

    /**
     * 设置响应信息
     *
     * @param data
     */
    public void setData(Object data) {
        put("data", data);
    }
}
