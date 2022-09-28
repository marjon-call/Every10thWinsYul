object "Every10thPlayerWins" {

    code {
        datacopy(0, dataoffset("runtime"), datasize("runtime"))
        return(0, datasize("runtime"))
    }

    object "runtime" {
        code {
            // get selector
            let selector := shr(0xe0, calldataload(0))

            switch selector
            // playGame()
            // must deposit 1 ether to play
            // every 10th contract caller wins the ether sent to contract
            case 0xaf899735 {
                playGame()                
            }

            // imFeelingSmart()
            // must deposit 3 ether to play smart
            // increments the queue by 2 instead of 1
            case 0xca53d32d {
                playSmart()
            }

            default {
                revert(0,0)
            }

            


            function playGame() {
                // checks the right amount of ether sent to contract
                if iszero(eq(callvalue(), 0xde0b6b3a7640000)) { revert(0,0) }

                let queueIndex := sload(0)

                // checks if you are the 10th player
                if eq(queueIndex, 9) {
                    // resets queue and rewards user with contract ether balance
                    sstore(0,0)
                    let s := call(gas(), caller(), selfbalance(), 0, 0, 0, 0)
                    leave
                }

                if gt(queueIndex, 9) {
                    sstore(0,0)
                    leave
                }

                // incriments queue
                sstore(0, add(queueIndex, 1))
            }



            function playSmart() {
                // checks the right amount of ether sent to contract
                if iszero(eq(callvalue(), 0x29A2241AF62C0000)) { revert(0,0) }

                let queueIndex := sload(0)

                // checks if you are the 8th player
                if eq(queueIndex, 8) {
                    // resets queue and rewards user with contract ether balance
                    sstore(0,0)
                    let s := call(gas(), caller(), selfbalance(), 0, 0, 0, 0)
                    leave
                }

                if gt(queueIndex, 8) {
                    sstore(0,0)
                    leave
                }

                // incriments queue
                sstore(0, add(queueIndex, 2))
            }


        }
    }

}