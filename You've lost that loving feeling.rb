use_bpm 95

live_loop :bass do
  with_fx :gverb, release: 2, room: 60, mix: 0.6 do
    with_fx :slicer, phase: 2, wave: 0, mix: 0, amp: 1 do
      6.times do
        a = ring(46,48).tick(:ii)
        6.times do
          tick(:i)
          synth :fm, note: a-0, release: ring(1,0.25,1).look(:i), amp: 3, env_curve: 1
          sleep ring(1.5,0.5,2).look(:i)
        end
      end
      tick_reset_all
      4.times do
        b = ring(62,64,65,67-12).tick(:ii)
        3.times do
          tick(:i)
          synth :fm, note: b-12, release: ring(1,0.25,1).look(:i), amp: 3, env_curve: 1
          sleep ring(1.5,0.5,2).look(:i)
        end
      end
    end
    tick_reset
    with_fx :lpf, cutoff: 60, cutoff_slide: 40, mix: 1 do |t|
      control t, cutoff: 120
      e = synth :dsaw, note: 60, note_slide: 0.5, detune: 0.3, sustain: 40, release: 0, amp: 1.2
      ee =  synth :dsaw, note: chord(60, :major), note_slide: 0.5, amp: 2, release: 20, cutoff: 100, sustain: 24, detune: 0.2
      11.times do
        tick
        control e, note: ring(60,60,67-12,60,60,60,58,58+7,58,58+7,60).look-24
        control ee, note: chord(ring(60,62,67,60,60,62,60,60,60,60,60).look+0, knit(:major,1,:minor7,1,:major,3,:minor7,1,:major,5).look, invert: ring(0,1,-2).choose)
        sleep knit(4,6,2,4,8,1).look
      end
    end
  end
end

in_thread do
  live_loop :treble do
    with_fx :gverb, room: 55, release: 8, mix: 0.4 do
      with_fx :echo, phase: 0.75, decay: 6, wave: 0, mix: 0, amp: 1 do
        6.times do
          synth :supersaw, note: chord(60+12, :major, invert: -2), amp: 1.5, attack: 4, release: 6, hard: 0.99, vel: 0.96
          sleep 8
        end
        tick_reset
        4.times do
          synth :supersaw, note: chord(ring(62,64,65,67-0).tick-12, ring(:minor7,:minor7,:major7,'7').look), amp: 1.5, sustain: 4
          sleep 4
        end
      end
    end
    tick_reset
    with_fx :level, amp: 2.5 do
      10.times do
        16.times do
          synth :pluck, note: 60+0, release: 0.2 if spread(5,16).tick
          synth :pluck, note: 67+0, release: 0.2 if spread(5,16).look
          synth :pluck, note: 60+24, release: 0.1
          synth :pluck, note: 67+24, release: 0.1
          sleep 0.25*1
        end
      end
    end
  end
end

live_loop :beat do
  with_fx :gverb, room: 70, release: 4, mix: 1 do
    sleep 4
    sample "E:/tig3rbabu/Msg 2 Jesus (No Martrs pliz)/Tamb.wav", amp: 5
    sleep 4
  end
end
