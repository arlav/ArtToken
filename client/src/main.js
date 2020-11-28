import { createApp } from "vue";
import App from "./App.vue";
import { IPFS_INJECTION_KEY, newIPFS } from "./plugins/ipfsHttpClient";
import { ETHERS_INJECTION_KEY, newEthers } from "./plugins/ethers";

const app = createApp(App);

app.provide(IPFS_INJECTION_KEY, newIPFS());
app.provide(ETHERS_INJECTION_KEY, newEthers());

app.mount("#app");
