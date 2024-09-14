import { PrismaClient } from "@prisma/client"

//instead of creating prisma client again and again, i will make the client once, and will be called many times
const globalForPrisma = globalThis as unknown as {
    prisma: PrismaClient | undefined
}

export const prisma = globalForPrisma.prisma ?? new PrismaClient()

if(process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma