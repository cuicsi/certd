# 贡献插件

## 1.本地调试运行

安装依赖包:      
```shell
# 设置环境变量
npm config set node_sqlite3_binary_host_mirror "https://registry.npmmirror.com/-/binary/sqlite3"

cd certd
# 安装依赖
pnpm install
```

启动 server:    
```shell
cd packages/ui/certd-server
npm run dev
```

启动 client:    
```shell
cd packages/ui/certd-client
npm run dev

# 会自动打开浏览器，确认正常运行

```

## 开发插件
进入 `packages/plugins/plugin-center/src`

### 1.复制demo目录作为你的插件目录
比如你想做cloudflare的插件，那么你可以复制demo目录，将其命名成cloudflare。

### 2. access授权
如果这是一个新的平台，它应该有授权方式，比如accessKey accessSecret之类的     
参考`demo/access.ts` 修改为你要做的平台的`access`
这样用户就可以在certd后台中创建这种授权凭证了

### 3. dns-provider
如果域名是这个平台进行解析的，那么你需要实现dns-provider
参考`demo/dns-provider.ts` 修改为你要做的平台的`dns-provider`

### 4. deploy-plugin
如果这个平台有需要部署证书的地方     
参考`demo/deploy-plugin.ts` 修改为你要做的平台的`deploy-plugin`

### 5. 增加导入
在`./src/你的插件目录/index.ts`中增加你的插件import
```ts
export * from './dns-provider'
export * from './plugin-test'
export * from './access'
````
在`./src/index.ts`中增加import
```ts
export * from "./你的插件目录"
```

## 重启服务进行调试
刷新浏览器，检查你的插件是否工作正常， 确保能够正常进行证书申请和部署    

## 提交PR
我们将尽快审核PR
