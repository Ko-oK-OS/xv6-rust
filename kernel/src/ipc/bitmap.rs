use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::arch::riscv::qemu::layout::*;

use core::sync::atomic::{AtomicI32, Ordering, fence};
use core::ptr::drop_in_place;
use array_macro::array;



pub const SHARE_MEM_AREA_SIZE: usize = 4*1024*1024;


pub const SHARE_MEM_MAP_PAGES: usize = SHARE_MEM_AREA_SIZE/(PGSIZE);
pub const SHARE_MEM_BIT_MAP_SIZE: usize = SHARE_MEM_MAP_PAGES/8+1;


pub struct BitMap{
    bitmap: [u8; SHARE_MEM_BIT_MAP_SIZE]
}

impl BitMap{
    pub fn page_to_addr(page: usize) -> usize{
        return MAP_START + page * PGSIZE;
    }

    pub fn addr_to_page(addr: usize) -> usize{
        if addr < MAP_START || addr > MAP_END {
            panic!("OUT OF MAP RANGE");
        }

        return (addr - MAP_START) / PGSIZE;
    }

    pub fn get_bit(&self, page: usize) -> usize {
        let index = page / 8;
        let bit = (self.bitmap[index] >> (page % 8)) & 1;
        return bit as usize;
    }

    pub fn set_bit(&mut self, page: usize, bit: usize){
        if bit == 1 {
            self.bitmap[page / 8] = self.bitmap[page / 8] | (1 << (page % 8));
        }else{
            self.bitmap[page / 8] = self.bitmap[page / 8] & !(1 << (page % 8));
        }
    }

    pub fn set_nbits(&mut self, page: usize, num: usize, bit: usize){
        for i in 0..num {
            self.set_bit(page + i, bit);
        }
    }

    pub fn get_unmapped_addr(&mut self, npages: usize) -> usize{
        let mut flag = false;
        let mut i: usize = 0;
        let mut j: usize = 0;
        let mut cnt: usize = 0;


        for idx in 0..SHARE_MEM_MAP_PAGES {
            if self.get_bit(idx) == 1 {
                continue;
            }

            i = idx;

            j = i;
            cnt = 0;

            while self.get_bit(j) == 0{
                j += 1;
                cnt += 1;

                if cnt >= npages {
                    flag = true;
                    break;
                }
            }

            if flag == true{
                break;
            }
        }

        if flag == true {
            self.set_nbits(i, npages, 1);
            return BitMap::page_to_addr(i);
        }else{
            return 0;
        }
    }


}

