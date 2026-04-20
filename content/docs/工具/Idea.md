# SpringBoot项目使用JRebel启动Actuator不显示问题

添加JVM参数

```
-Dcom.sun.management.jmxremote.port=1099
-Dcom.sun.management.jmxremote.local.only=false
-Dcom.sun.management.jmxremote.authenticate=false
-Dcom.sun.management.jmxremote.ssl=false
```

