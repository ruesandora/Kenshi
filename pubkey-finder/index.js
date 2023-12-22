import bls from '@chainsafe/bls';
import { Base58 } from "base-ex";
import promptSync from 'prompt-sync';

var encoder = new Base58("bitcoin");

const prompt = promptSync();
const sk = prompt("Enter your secret key: ");

const decoded = Buffer.from(encoder.decode(sk));
const secretKey = bls.SecretKey.fromBytes(decoded);
const publicKey = secretKey.toPublicKey();

const key = encoder.encode(publicKey.toBytes())
console.log("Your public key is", key);