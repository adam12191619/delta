import React from 'react';
import { StyleSheet, ViewStyle } from 'react-native';
import { MotiView, MotiText } from 'moti';
import { BlurView } from 'expo-blur';
import { LinearGradient } from 'expo-linear-gradient';

// 1. Card Kaca yang bikin GPU kerja keras 💀
export const GlassCard = ({ children, delay = 0 }: { children: React.ReactNode, delay?: number }) => {
  return (
    <MotiView
      from={{ opacity: 0, scale: 0.5, translateY: 50 }}
      animate={{ opacity: 1, scale: 1, translateY: 0 }}
      transition={{ type: 'spring', delay, damping: 15 }}
      style={styles.cardContainer}
    >
      <BlurView intensity={80} tint="dark" style={styles.blurWrapper}>
        <LinearGradient
          colors={['rgba(255,255,255,0.1)', 'rgba(255,255,255,0.02)']}
          style={styles.gradientBorder}
        >
          {children}
        </LinearGradient>
      </BlurView>
    </MotiView>
  );
};

// 2. Teks yang berdenyut (Pulse)
export const NeonText = ({ text }: { text: string }) => {
  return (
    <MotiText
      from={{ opacity: 0.5, textShadowRadius: 5 }}
      animate={{ opacity: 1, textShadowRadius: 20 }}
      transition={{
        type: 'timing',
        duration: 1000,
        loop: true,
        repeatReverse: true,
      }}
      style={styles.neonText}
    >
      {text}
    </MotiText>
  );
};

// 3. Floating Orb (Background yang bikin lag HP kentang)
export const FloatingOrb = ({ color, size, top, left }: { color: string, size: number, top: number, left: number }) => {
  return (
    <MotiView
      from={{ translateX: 0, translateY: 0, scale: 1 }}
      animate={{ 
        translateX: Math.random() * 50, 
        translateY: Math.random() * 50,
        scale: 1.2 
      }}
      transition={{
        type: 'timing',
        duration: 3000,
        loop: true,
        repeatReverse: true,
      }}
      style={[
        styles.orb, 
        { backgroundColor: color, width: size, height: size, top, left, borderRadius: size / 2 }
      ]}
    />
  );
};

const styles = StyleSheet.create({
  cardContainer: {
    margin: 10,
    borderRadius: 24,
    overflow: 'hidden',
    borderWidth: 1,
    borderColor: 'rgba(255,255,255,0.1)',
  },
  blurWrapper: {
    padding: 20,
  },
  gradientBorder: {
    borderRadius: 24,
  },
  neonText: {
    color: '#00ffff',
    fontSize: 18,
    fontWeight: 'bold',
    textShadowColor: '#00ffff',
  },
  orb: {
    position: 'absolute',
    opacity: 0.3,
    filter: 'blur(40px)', // Ini yang bikin berat 💀
  },
});
