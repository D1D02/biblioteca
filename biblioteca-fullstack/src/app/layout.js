import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

import Header from "./component/header/header.js";
import Sidebar from "./component/sidebar/sidebar.js";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata = {
  title: "Biblioteca",
  description: "Created by D1D02",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable}`}>
      <body>
        <Header />
        <div className="main_layout">
          <Sidebar/>
          {children}
        </div>
      </body>
    </html>
  );
}
