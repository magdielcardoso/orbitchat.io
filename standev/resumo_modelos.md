# Resumo dos Modelos e Relacionamentos

**Account**  
Unidade máxima de isolamento (Tenant). Todos os recursos pertencem a uma Account.
- **User**: Pertence à Account. Representa agentes, admins, etc.
- **Role**: Permissões customizáveis por Account.
- **Inbox**: Caixa de entrada multicanal da Account.
- **Macro**: Respostas rápidas da Account.
- **Automation**: Regras automáticas da Account.
- **Contact**: Clientes/usuários finais da Account.
- **FeatureFlag**: Ativação de features por Account.
- **Branding**: Customização visual da Account.

**Inbox**  
Pertence à Account.
- **Channel**: Cada Inbox pode ter vários canais (e-mail, WhatsApp, etc.).
- **Conversation**: Conversas associadas à Inbox.
- **Agent**: Usuários atribuídos à Inbox.
- **SLA**: Inbox pode ser vinculada a uma ou mais SLAs.
- **WebWidget**: Widget de chat vinculado à Inbox.

**Conversation**  
Pertence à Inbox.
- **Message**: Conversa composta por várias mensagens.
- **Contact**: Participante da conversa.

**Channel**  
Pertence à Inbox.
- **Message**: Mensagens trafegam por canais.

**SLA**  
Criada no contexto da Account, pode ser vinculada a uma ou mais Inboxes.

---

**Resumo dos relacionamentos:**
- Account → [User, Role, Inbox, Macro, Automation, Contact, FeatureFlag, Branding]
- Inbox → [Channel, Conversation, Agent, SLA, WebWidget]
- Conversation → [Message, Contact]
- Channel → [Message]
- SLA ↔ Inbox (vínculo flexível, N:N possível) 