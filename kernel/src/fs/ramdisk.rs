use super::Buf;

/// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VAILD. 
/// Else if B_VAILD is not set, read buf from disk, set B_VALID. 
pub fn ramdiskrw(b: Buf) {
    // Buf warp SleepGuard, which guarante b is locked

    
    
}