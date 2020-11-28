import IPFSHttpClient from "ipfs-http-client";
import { inject } from "vue";

const IPFS_INJECTION_KEY = "IPFS-HTTP-CLIENT";

const newIPFS = () => {
	return IPFSHttpClient({
		host: "localhost",
		port: "5001",
		protocol: "http",
		timeout: 5000
	});
};

function UseIPFSClient() {
	const ipfsClient = inject(IPFS_INJECTION_KEY);

	if (!ipfsClient) {
		throw new Error("IPFS client instance not found");
	}

	return ipfsClient;
}

export { IPFS_INJECTION_KEY, newIPFS, UseIPFSClient };
