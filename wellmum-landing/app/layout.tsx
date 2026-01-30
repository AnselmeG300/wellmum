import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "WellMum - Finding yourself after baby",
  description: "Wellmum is more than just a program: it's a wellness app designed for mums. With tailored routines, a caring AI coach, and a supportive community.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        {children}
      </body>
    </html>
  );
}
