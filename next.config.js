/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ["images.pexels.com", "pexels.com", "res.cloudinary.com"],
  },
};

module.exports = nextConfig

module.exports = {
  experimental: {
    missingSuspenseWithCSRBailout: false,
  },
};
