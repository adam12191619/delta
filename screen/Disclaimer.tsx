import React, { useState } from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet } from 'react-native';
import { MotiView } from 'moti';
import { ShieldAlert, CheckCircle2 } from 'lucide-react-native';
import { GlassCard, NeonText, FloatingOrb } from '../components/motion';

export default function Disclaimer({ onAccept }: { onAccept: () => void }) {
  const [checked, setChecked] = useState(false);

  return (
    <View style={styles.container}>
      <FloatingOrb color="#ff0055" size={300} top={-100} left={-50} />
      
      <MotiView 
        from={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        style={styles.content}
      >
        <ShieldAlert color="#ff0055" size={64} style={{ alignSelf: 'center', marginBottom: 20 }} />
        
        <GlassCard>
          <NeonText text="DELTA TERMINAL - LEGAL" />
          <View style={styles.divider} />
          <ScrollView style={styles.scrollBox}>
            <Text style={styles.legalText}>
              1. This tool is for EDUCATIONAL purposes only.{"\n\n"}
              2. Unauthorized access to networks/devices is ILLEGAL.{"\n\n"}
              3. You are 100% responsible for your actions.{"\n\n"}
              4. The developer (DELTA Team) holds NO liability for misuse.{"\n\n"}
              5. By clicking 'INITIALIZE', you confirm you are 18+ and have ethical intentions.
            </Text>
          </ScrollView>
        </GlassCard>

        <TouchableOpacity 
          style={styles.checkboxArea} 
          onPress={() => setChecked(!checked)}
        >
          <CheckCircle2 color={checked ? "#00ffcc" : "#333"} size={24} />
          <Text style={styles.checkLabel}>I understand the risks & 18+ years old</Text>
        </TouchableOpacity>

        <TouchableOpacity 
          disabled={!checked}
          onPress={onAccept}
          style={[styles.btn, { opacity: checked ? 1 : 0.3 }]}
        >
          <Text style={styles.btnText}>INITIALIZE SYSTEM</Text>
        </TouchableOpacity>
      </MotiView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#000', justifyContent: 'center', padding: 20 },
  content: { zIndex: 10 },
  divider: { height: 1, backgroundColor: 'rgba(255,255,255,0.1)', marginVertical: 15 },
  scrollBox: { height: 250 },
  legalText: { color: '#aaa', lineHeight: 20, fontSize: 13 },
  checkboxArea: { flexDirection: 'row', alignItems: 'center', marginTop: 25, gap: 10 },
  checkLabel: { color: '#fff', fontSize: 12 },
  btn: { 
    backgroundColor: '#ff0055', 
    padding: 18, 
    borderRadius: 15, 
    marginTop: 30, 
    alignItems: 'center',
    shadowColor: '#ff0055',
    shadowRadius: 15,
    shadowOpacity: 0.5
  },
  btnText: { color: '#fff', fontWeight: 'bold', letterSpacing: 2 }
});
