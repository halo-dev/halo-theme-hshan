import {defineConfig} from "vite";
import path from "path";

export default defineConfig({
    plugins: [],
    build: {
        lib: {
            entry: path.resolve(__dirname, "src/main.ts"),
            name: "main",
            fileName: "main",
            formats: ["umd"],
        },
    },
});