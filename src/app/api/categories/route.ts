// import { PrismaClient } from "@prisma/client";
import { prisma } from "@/utils/connect";
import { NextResponse } from "next/server";

// const prisma = new PrismaClient();

export const GET = async () => {
    try{
        const categories = await prisma.category.findMany();
        return new NextResponse(JSON.stringify(categories), { status: 200 });
    }catch(err){
        console.log(err)
        return new NextResponse(JSON.stringify({message: "Error in fetching category"}), { status: 500 });
    }
}

export const POST = () => {
    return new NextResponse("Hello", { status: 200 });
}