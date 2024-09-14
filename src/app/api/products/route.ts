// import { PrismaClient } from "@prisma/client";
import { prisma } from "@/utils/connect"; //importing global prisma instead of creating the instance every time
import { NextRequest, NextResponse } from "next/server";

// const prisma = new PrismaClient();

export const GET = async (req: NextRequest) => {
    //my request will be like -> localhost:3000/api/products?cat="body"
    const { searchParams } = new URL(req.url)
    const cat = searchParams.get("cat")

    try{
        const products = await prisma.product.findMany({
            where:{
                ...(cat ? { catSlug: cat } : { isFeatured: true })
            }
        });
        return new NextResponse(JSON.stringify(products), { status: 200 });
    }catch(err){
        console.log(err)
        return new NextResponse(JSON.stringify({message: "Error in fetching category"}), { status: 500 });
    }
}

export const POST = () => {
    return new NextResponse("Hello", { status: 200 });
}